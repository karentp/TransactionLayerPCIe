`timescale 	1ns				/ 100ps
`include "FIFO.v"
`include "Probador.v"
`include "cmos_cells.v"
`include "FIFO_estruct.v"


module BancoPruebas; // Testbench

    wire almost_empty_conduct, almost_empty_estruct, almost_full_estruct;	
    wire [9:0] data_out_conduct, data_out_estruct;	
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		clk;			// From prob of Probador.v
    wire [9:0]		data_in;		// From prob of Probador.v
    wire		pop;			// From prob of Probador.v
    wire		push;			// From prob of Probador.v
    wire		reset;			// From prob of Probador.v
    // End of automatics



    FIFO conductual (
            .data_out(data_out_conduct),
            .almost_empty(almost_empty_conduct),
            .almost_full(almost_full_conduct),
        /*AUTOINST*/
		     // Inputs
		     .clk		(clk),
		     .reset		(reset),
		     .push		(push),
		     .pop		(pop),
		     .data_in		(data_in[9:0]));

	Probador prob (
            .data_out_conduct(data_out_conduct),
            .data_out_estruct(data_out_estruct),
            .almost_empty_conduct(almost_empty_conduct),
            .almost_full_conduct(almost_full_conduct),
            .almost_empty_estruct(almost_empty_estruct),
            .almost_full_estruct(almost_full_estruct),
        /*AUTOINST*/
		       // Outputs
		       .clk		(clk),
		       .reset		(reset),
		       .push		(push),
		       .pop		(pop),
		       .data_in		(data_in[9:0]));

    FIFO_estruct estructural (
            .data_out(data_out_estruct),
            .almost_empty(almost_empty_estruct),
            .almost_full(almost_full_estruct),
        /*AUTOINST*/
			      // Inputs
			      .clk		(clk),
			      .data_in		(data_in[9:0]),
			      .pop		(pop),
			      .push		(push),
			      .reset		(reset));
    
endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End:
