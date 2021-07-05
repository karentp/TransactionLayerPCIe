`timescale 	1ns				/ 100ps
`include "FIFO.v"
`include "Probador_Contador.v"
`include "cmos_cells.v"
`include "FIFO_estruct.v"
`include "Contador.v"
`include "Contador_estruct.v"


module BancoPruebas_Contador; // Testbench

    wire [9:0] data_out_0_c, data_out_1_c, data_out_2_c, data_out_3_c;	
    wire [9:0] data_out_0_e, data_out_1_e, data_out_2_e, data_out_3_e;
    wire [9:0] data_in_0, data_in_1, data_in_2, data_in_3;
    wire [4:0] data_out_c, data_out_e;
    wire push_0, push_1, push_2, push_3;
    wire valid_c, valid_e;
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		almost_empty;		// From FIFO_0_c of FIFO.v, ...
    wire		almost_full;		// From FIFO_0_c of FIFO.v, ...
    wire		clk;			// From prob of Probador_Contador.v
    wire [1:0]		idx;			// From prob of Probador_Contador.v
    wire		pop;			// From prob of Probador_Contador.v
    wire		req;			// From prob of Probador_Contador.v
    wire [3:0]		state;			// From prob of Probador_Contador.v
    wire [2:0]		umbral_inferior;	// From prob of Probador_Contador.v
    wire [2:0]		umbral_superior;	// From prob of Probador_Contador.v
    // End of automatics
    


    ///////////////////////////////// FIFOS Conductuales /////////////////////////

    FIFO FIFO_0_c (
            .data_in(data_in_0),
            .data_out(data_out_0_c),
            .push(push_0),
        /*AUTOINST*/
		   // Outputs
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   // Inputs
		   .clk			(clk),
		   .state		(state[3:0]),
		   .pop			(pop),
		   .umbral_superior	(umbral_superior[2:0]),
		   .umbral_inferior	(umbral_inferior[2:0]));

    FIFO FIFO_1_c (
            .data_in(data_in_1),
            .data_out(data_out_1_c),
            .push(push_1),
        /*AUTOINST*/
		   // Outputs
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   // Inputs
		   .clk			(clk),
		   .state		(state[3:0]),
		   .pop			(pop),
		   .umbral_superior	(umbral_superior[2:0]),
		   .umbral_inferior	(umbral_inferior[2:0]));

    FIFO FIFO_2_c (
            .data_in(data_in_2),
            .data_out(data_out_2_c),
            .push(push_2),
        /*AUTOINST*/
		   // Outputs
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   // Inputs
		   .clk			(clk),
		   .state		(state[3:0]),
		   .pop			(pop),
		   .umbral_superior	(umbral_superior[2:0]),
		   .umbral_inferior	(umbral_inferior[2:0]));

    FIFO FIFO_3_c (
            .data_in(data_in_3),
            .data_out(data_out_3_c),
            .push(push_3),
        /*AUTOINST*/
		   // Outputs
		   .almost_full		(almost_full),
		   .almost_empty	(almost_empty),
		   // Inputs
		   .clk			(clk),
		   .state		(state[3:0]),
		   .pop			(pop),
		   .umbral_superior	(umbral_superior[2:0]),
		   .umbral_inferior	(umbral_inferior[2:0]));


    /////////////////////////////// FIFOS Estructurales ////////////////////////////

    FIFO_estruct FIFO_0_e (
            .data_in(data_in_0),
            .data_out(data_out_0_e),
            .push(push_0),
        /*AUTOINST*/
			   // Outputs
			   .almost_empty	(almost_empty),
			   .almost_full		(almost_full),
			   // Inputs
			   .clk			(clk),
			   .pop			(pop),
			   .state		(state[3:0]),
			   .umbral_inferior	(umbral_inferior[2:0]),
			   .umbral_superior	(umbral_superior[2:0]));

    FIFO_estruct FIFO_1_e (
            .data_in(data_in_1),
            .data_out(data_out_1_e),
            .push(push_1),
        /*AUTOINST*/
			   // Outputs
			   .almost_empty	(almost_empty),
			   .almost_full		(almost_full),
			   // Inputs
			   .clk			(clk),
			   .pop			(pop),
			   .state		(state[3:0]),
			   .umbral_inferior	(umbral_inferior[2:0]),
			   .umbral_superior	(umbral_superior[2:0]));

    FIFO_estruct FIFO_2_e (
            .data_in(data_in_2),
            .data_out(data_out_2_e),
            .push(push_2),
        /*AUTOINST*/
			   // Outputs
			   .almost_empty	(almost_empty),
			   .almost_full		(almost_full),
			   // Inputs
			   .clk			(clk),
			   .pop			(pop),
			   .state		(state[3:0]),
			   .umbral_inferior	(umbral_inferior[2:0]),
			   .umbral_superior	(umbral_superior[2:0]));

    FIFO_estruct FIFO_3_e (
            .data_in(data_in_3),
            .data_out(data_out_3_e),
            .push(push_3),
        /*AUTOINST*/
			   // Outputs
			   .almost_empty	(almost_empty),
			   .almost_full		(almost_full),
			   // Inputs
			   .clk			(clk),
			   .pop			(pop),
			   .state		(state[3:0]),
			   .umbral_inferior	(umbral_inferior[2:0]),
			   .umbral_superior	(umbral_superior[2:0]));


    /////////////////////////////////// Probador ////////////////////////////////

	Probador_Contador prob (
            .data_in_0(data_in_0),
            .data_in_1(data_in_1),
            .data_in_2(data_in_2),
            .data_in_3(data_in_3),
            .data_out_c(data_out_c),
            .data_out_e(data_out_e),
            .valid_c(valid_c),
            .valid_e(valid_e),
        /*AUTOINST*/
				// Outputs
				.clk		(clk),
				.state		(state[3:0]),
				.push_0		(push_0),
				.push_1		(push_1),
				.push_2		(push_2),
				.push_3		(push_3),
				.pop		(pop),
				.umbral_superior(umbral_superior[2:0]),
				.umbral_inferior(umbral_inferior[2:0]),
				.req		(req),
				.idx		(idx[1:0]));



    /////////////////////////////////// Contador conductual ////////////////////////

    Contador contador_c(
            .data_FIFO_0(data_out_0_c),
            .data_FIFO_1(data_out_1_c),
            .data_FIFO_2(data_out_2_c),
            .data_FIFO_3(data_out_3_c),
            .data_out(data_out_c),
            .valid(valid_c),
        /*AUTOINST*/
			// Inputs
			.req		(req),
			.clk		(clk),
			.state		(state[3:0]),
			.idx		(idx[1:0]));

    ////////////////////////////////// Contador estructual //////////////////////////

    Contador_estruct contador_e(
            .data_FIFO_0(data_out_0_e),
            .data_FIFO_1(data_out_1_e),
            .data_FIFO_2(data_out_2_e),
            .data_FIFO_3(data_out_3_e),
            .data_out(data_out_e),
            .valid(valid_e),
        /*AUTOINST*/
				// Inputs
				.clk		(clk),
				.idx		(idx[1:0]),
				.req		(req),
				.state		(state[3:0]));

    
endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End:
