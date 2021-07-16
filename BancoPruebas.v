`timescale 	1ns				/ 100ps
`include "TransactionLayerPCIe_c.v"
`include "Probador.v"
`include "TransactionLayerPCIe_e.v"


module BancoPruebas(/*AUTOARG*/); // Testbench
    wire	[9:0]	data_out0_c;		// From conductual of TransactionLayerPCIe_c.v
    wire	[9:0]	data_out1_c;		// From conductual of TransactionLayerPCIe_c.v
    wire	[9:0]	data_out2_c;		// From conductual of TransactionLayerPCIe_c.v
    wire	[9:0]	data_out3_c;
	wire	[4:0]	contador_c;		// From conductual of TransactionLayerPCIe_c.v
	wire	[9:0]	data_out0_e;		// From estructural of TransactionLayerPCIe_e.v
    wire	[9:0]	data_out1_e;		// From estructural of TransactionLayerPCIe_e.v
    wire	[9:0]	data_out2_e;		// From estructural of TransactionLayerPCIe_e.v
    wire	[9:0]	data_out3_e;
    wire	[4:0]	contador_e;		// From estructural of TransactionLayerPCIe_e.v		// From estructural of TransactionLayerPCIe_e.v
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire [2:0]		Umbral_alto;		// From testbench of Probador.v
    wire [2:0]		Umbral_bajo;		// From testbench of Probador.v
    wire		clk;			// From testbench of Probador.v
    wire [9:0]		data_in0;		// From testbench of Probador.v
    wire [9:0]		data_in1;		// From testbench of Probador.v
    wire [9:0]		data_in2;		// From testbench of Probador.v
    wire [9:0]		data_in3;		// From testbench of Probador.v
    wire [1:0]		idx;			// From testbench of Probador.v
    wire		init;			// From testbench of Probador.v
    wire		pop_in0;		// From testbench of Probador.v
    wire		pop_in1;		// From testbench of Probador.v
    wire		pop_in2;		// From testbench of Probador.v
    wire		pop_in3;		// From testbench of Probador.v
    wire		push_in0;		// From testbench of Probador.v
    wire		push_in1;		// From testbench of Probador.v
    wire		push_in2;		// From testbench of Probador.v
    wire		push_in3;		// From testbench of Probador.v
    wire		req;			// From testbench of Probador.v
    wire		reset;			// From testbench of Probador.v
    wire		valid_c;		// From conductual of TransactionLayerPCIe_c.v
    wire		valid_e;		// From estructural of TransactionLayerPCIe_e.v
    // End of automatics

    TransactionLayerPCIe_c conductual (
		// Outputs
				       .data_out0	(data_out0_c),
				       .data_out1	(data_out1_c),
				       .data_out2	(data_out2_c),
				       .data_out3	(data_out3_c),
				       .contador	(contador_c),
				       .valid		(valid_c),
        /*AUTOINST*/
				       // Inputs
				       .clk		(clk),
				       .req		(req),
				       .idx		(idx[1:0]),
				       .data_in0	(data_in0[9:0]),
				       .data_in1	(data_in1[9:0]),
				       .data_in2	(data_in2[9:0]),
				       .data_in3	(data_in3[9:0]),
				       .reset		(reset),
				       .init		(init),
				       .Umbral_bajo	(Umbral_bajo[2:0]),
				       .Umbral_alto	(Umbral_alto[2:0]),
				       .push_in0	(push_in0),
				       .push_in1	(push_in1),
				       .push_in2	(push_in2),
				       .push_in3	(push_in3),
				       .pop_in0		(pop_in0),
				       .pop_in1		(pop_in1),
				       .pop_in2		(pop_in2),
				       .pop_in3		(pop_in3));

	Probador testbench (
        /*AUTOINST*/
			    // Outputs
			    .clk		(clk),
			    .req		(req),
			    .idx		(idx[1:0]),
			    .data_in0		(data_in0[9:0]),
			    .data_in1		(data_in1[9:0]),
			    .data_in2		(data_in2[9:0]),
			    .data_in3		(data_in3[9:0]),
			    .reset		(reset),
			    .init		(init),
			    .Umbral_bajo	(Umbral_bajo[2:0]),
			    .Umbral_alto	(Umbral_alto[2:0]),
			    .push_in0		(push_in0),
			    .push_in1		(push_in1),
			    .push_in2		(push_in2),
			    .push_in3		(push_in3),
			    .pop_in0		(pop_in0),
			    .pop_in1		(pop_in1),
			    .pop_in2		(pop_in2),
			    .pop_in3		(pop_in3),
			    // Inputs
			    .data_out0_c	(data_out0_c[9:0]),
			    .data_out1_c	(data_out1_c[9:0]),
			    .data_out2_c	(data_out2_c[9:0]),
			    .data_out3_c	(data_out3_c[9:0]),
			    .data_out0_e	(data_out0_e[9:0]),
			    .data_out1_e	(data_out1_e[9:0]),
			    .data_out2_e	(data_out2_e[9:0]),
			    .data_out3_e	(data_out3_e[9:0]),
			    .contador_c		(contador_c[4:0]),
			    .contador_e		(contador_e[4:0]),
			    .valid_c		(valid_c),
			    .valid_e		(valid_e));

    TransactionLayerPCIe_e estructural (
		// Outputs
					.data_out0	(data_out0_e),
					.data_out1	(data_out1_e),
					.data_out2	(data_out2_e),
					.data_out3	(data_out3_e),
					.contador	(contador_e),
					.valid		(valid_e),
        /*AUTOINST*/
					// Inputs
					.clk		(clk),
					.req		(req),
					.idx		(idx[1:0]),
					.data_in0	(data_in0[9:0]),
					.data_in1	(data_in1[9:0]),
					.data_in2	(data_in2[9:0]),
					.data_in3	(data_in3[9:0]),
					.reset		(reset),
					.init		(init),
					.Umbral_bajo	(Umbral_bajo[2:0]),
					.Umbral_alto	(Umbral_alto[2:0]),
					.push_in0	(push_in0),
					.push_in1	(push_in1),
					.push_in2	(push_in2),
					.push_in3	(push_in3),
					.pop_in0	(pop_in0),
					.pop_in1	(pop_in1),
					.pop_in2	(pop_in2),
					.pop_in3	(pop_in3));
    
endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End:
