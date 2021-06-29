`timescale 	1ns				/ 100ps
`include "FIFO.v"
`include "Probador.v"
`include "cmos_cells.v"


module BancoPruebas; // Testbench

	
	wire	clk, reset, push, pop, almost_full, almost_empty;			
	wire [9:0]	data_in, data_out;	




    FIFO UnFiFo( 
            .clk(clk), 
            .reset(reset),
            .push(push),
            .pop(pop),
            .data_in(data_in),
            .data_out(data_out),
            .almost_empty(almost_empty),
            .almost_full(almost_full));

	    Probador prob( 
            .clk(clk), 
            .reset(reset),
            .push(push),
            .pop(pop),
            .data_in(data_in));

endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End: