`timescale 	1ns				/ 100ps
`include "FIFO.v"
`include "Probador.v"
`include "cmos_cells.v"
`include "FIFO_estruct.v"


module BancoPruebas; // Testbench

	
	wire	clk, reset, push, pop, almost_full_conduct, almost_empty_conduct, almost_empty_estruct, almost_full_estruct;			
	wire [9:0]	data_in, data_out_conduct, data_out_estruct;	




    FIFO conductual( 
            .clk(clk), 
            .reset(reset),
            .push(push),
            .pop(pop),
            .data_in(data_in),
            .data_out(data_out_conduct),
            .almost_empty(almost_empty_conduct),
            .almost_full(almost_full_conduct));

	Probador prob( 
            .clk(clk), 
            .reset(reset),
            .push(push),
            .pop(pop),
            .data_in(data_in),
            .data_out_conduct(data_out_conduct),
            .data_out_estruct(data_out_estruct),
            .almost_empty_conduct(almost_empty_conduct),
            .almost_full_conduct(almost_full_conduct),
            .almost_empty_estruct(almost_empty_estruct),
            .almost_full_estruct(almost_full_estruct));

    FIFO_estruct estructural ( 
            .clk(clk), 
            .reset(reset),
            .push(push),
            .pop(pop),
            .data_in(data_in),
            .data_out(data_out_estruct),
            .almost_empty(almost_empty_estruct),
            .almost_full(almost_full_estruct));
endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End: