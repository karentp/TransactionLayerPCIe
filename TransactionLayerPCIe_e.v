`include "FIFO_estruct.v"
`include "MUX_estruct.v"
`include "Contador_estruct.v"
`include "arbitro_estruct.v"
`include "MaquinaEstados_estruct.v"
`include "cmos_cells.v"

module TransactionLayerPCIe_e(
    input clk,
    input req,
    input [1:0] idx,
    input [9:0] data_in0, data_in1, data_in2, data_in3,
    input reset, init,
    input [2:0] Umbral_bajo, Umbral_alto,
    input push_in0, push_in1, push_in2, push_in3,
    input pop_in0, pop_in1, pop_in2, pop_in3,
    output [9:0] data_out0, data_out1, data_out2, data_out3,
    output [4:0] contador,
    output valid
/*AUTOARG*/);

wire pop_Ar0, pop_Ar1, pop_Ar2, pop_Ar3; 
wire push_Ar0, push_Ar1, push_Ar2, push_Ar3;

wire almost_full0, almost_full1, almost_full2, almost_full3;
wire empty0, empty1, empty2, empty3, empty4, empty5, empty6, empty7;

wire [9:0] inFIFO_out0, inFIFO_out1, inFIFO_out2, inFIFO_out3;
wire [9:0] outFIFO_in0, outFIFO_in1, outFIFO_in2, outFIFO_in3;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			almost_empty;		// From FIFO_in0 of FIFO_estruct.v, ...
wire			almost_full;		// From FIFO_in0 of FIFO_estruct.v, ...
wire [7:0]		empties;		// From arbitreiro of arbitro_estruct.v
wire			push;			// From arbitreiro of arbitro_estruct.v
wire [3:0]		state;			// From FSM of MaquinaEstados_estruct.v
wire [2:0]		umbral_inferior;	// From FSM of MaquinaEstados_estruct.v
wire [2:0]		umbral_superior;	// From FSM of MaquinaEstados_estruct.v
// End of automatics

//------------------------------------- FIFOS de entrada -------------------------------//
FIFO_estruct FIFO_in0( 
    .push(push_in0),
    .pop(pop_Ar0),
    .data_in(data_in0),
    .data_out(outFIFO_in0),
    .empty(empty0),
    /*AUTOINST*/
		      // Outputs
		      .almost_empty	(almost_empty),
		      .almost_full	(almost_full),
		      // Inputs
		      .clk		(clk),
		      .state		(state[3:0]),
		      .umbral_inferior	(umbral_inferior[2:0]),
		      .umbral_superior	(umbral_superior[2:0]));
FIFO_estruct FIFO_in1( 
    .push(push_in1),
    .pop(pop_Ar1),
    .data_in(data_in1),
    .data_out(outFIFO_in1),
    .empty(empty1),
    /*AUTOINST*/
		      // Outputs
		      .almost_empty	(almost_empty),
		      .almost_full	(almost_full),
		      // Inputs
		      .clk		(clk),
		      .state		(state[3:0]),
		      .umbral_inferior	(umbral_inferior[2:0]),
		      .umbral_superior	(umbral_superior[2:0]));
FIFO_estruct FIFO_in2( 
    .push(push_in2),
    .pop(pop_Ar2),
    .data_in(data_in2),
    .data_out(outFIFO_in2),
    .empty(empty2),
    /*AUTOINST*/
		      // Outputs
		      .almost_empty	(almost_empty),
		      .almost_full	(almost_full),
		      // Inputs
		      .clk		(clk),
		      .state		(state[3:0]),
		      .umbral_inferior	(umbral_inferior[2:0]),
		      .umbral_superior	(umbral_superior[2:0]));
FIFO_estruct FIFO_in3( 
    .push(push_in3),
    .pop(pop_Ar3),
    .data_in(data_in3),
    .data_out(outFIFO_in3),
    .empty(empty3),
    /*AUTOINST*/
		      // Outputs
		      .almost_empty	(almost_empty),
		      .almost_full	(almost_full),
		      // Inputs
		      .clk		(clk),
		      .state		(state[3:0]),
		      .umbral_inferior	(umbral_inferior[2:0]),
		      .umbral_superior	(umbral_superior[2:0]));


//------------------------------------- FIFOS de salida -------------------------------//

FIFO_estruct FIFO_out0( 
    .pop(pop_in0),
    .data_in(inFIFO_out0),
    .data_out(data_out0),
    .empty(empty4),
    .almost_full		(almost_full0),
    /*AUTOINST*/
		       // Outputs
		       .almost_empty	(almost_empty),
		       // Inputs
		       .clk		(clk),
		       .push		(push),
		       .state		(state[3:0]),
		       .umbral_inferior	(umbral_inferior[2:0]),
		       .umbral_superior	(umbral_superior[2:0]));
FIFO_estruct FIFO_out1( 
    .pop(pop_in1),
    .data_in(inFIFO_out1),
    .data_out(data_out1),
    .empty(empty5),
    .almost_full		(almost_full1),
    /*AUTOINST*/
		       // Outputs
		       .almost_empty	(almost_empty),
		       // Inputs
		       .clk		(clk),
		       .push		(push),
		       .state		(state[3:0]),
		       .umbral_inferior	(umbral_inferior[2:0]),
		       .umbral_superior	(umbral_superior[2:0]));
FIFO_estruct FIFO_out2( 
    .pop(pop_in2),
    .data_in(inFIFO_out2),
    .data_out(data_out2),
    .empty(empty6),
    .almost_full		(almost_full2),
    /*AUTOINST*/
		       // Outputs
		       .almost_empty	(almost_empty),
		       // Inputs
		       .clk		(clk),
		       .push		(push),
		       .state		(state[3:0]),
		       .umbral_inferior	(umbral_inferior[2:0]),
		       .umbral_superior	(umbral_superior[2:0]));
FIFO_estruct FIFO_out3( 
    .pop(pop_in3),
    .data_in(inFIFO_out3),
    .data_out(data_out3),
    .empty(empty7),
    .almost_full		(almost_full3),
    /*AUTOINST*/
		       // Outputs
		       .almost_empty	(almost_empty),
		       // Inputs
		       .clk		(clk),
		       .push		(push),
		       .state		(state[3:0]),
		       .umbral_inferior	(umbral_inferior[2:0]),
		       .umbral_superior	(umbral_superior[2:0]));

//------------------------------------- MUXES -------------------------------//

MUX_estruct multiplexores(
    .P0(outFIFO_in0),
    .P1(outFIFO_in1),
    .P2(outFIFO_in2),
    .P3(outFIFO_in3),
    .Out0(inFIFO_out0),
    .Out1(inFIFO_out1),
    .Out2(inFIFO_out2),
    .Out3(inFIFO_out3),
    /*AUTOINST*/
			  // Inputs
			  .clk			(clk),
			  .state		(state[3:0]));


//------------------------------------- Contadores -------------------------------//


Contador_estruct Contadores(
    .data_FIFO_0(data_out0),
    .data_FIFO_1(data_out1),
    .data_FIFO_2(data_out2),
    .data_FIFO_3(data_out3),
    .data_out(contador),
    /*AUTOINST*/
			    // Outputs
			    .valid		(valid),
			    // Inputs
			    .clk		(clk),
			    .idx		(idx[1:0]),
			    .req		(req),
			    .state		(state[3:0]));


//------------------------------------- Arbitro ------------------------------------------//



arbitro_estruct arbitreiro(
    .empty0_naranja(empty0),
    .empty1_naranja(empty1),
    .empty2_naranja(empty2),
    .empty3_naranja(empty3),
    .empty0_morado(empty4),
    .empty1_morado(empty5),
    .empty2_morado(empty6),
    .empty3_morado(empty7),
    .pop0(pop_Ar0),
    .pop1(pop_Ar1),
    .pop2(pop_Ar2),
    .pop3(pop_Ar3),
    /*AUTOINST*/
			   // Outputs
			   .empties		(empties[7:0]),
			   .push		(push),
			   // Inputs
			   .almost_full0	(almost_full0),
			   .almost_full1	(almost_full1),
			   .almost_full2	(almost_full2),
			   .almost_full3	(almost_full3),
			   .clk			(clk),
			   .state		(state[3:0]));



//------------------------------------- Maquina de estados  -------------------------------//

MaquinaEstados_estruct FSM (
    /*AUTOINST*/
			    // Outputs
			    .state		(state[3:0]),
			    .umbral_inferior	(umbral_inferior[2:0]),
			    .umbral_superior	(umbral_superior[2:0]),
			    // Inputs
			    .Umbral_alto	(Umbral_alto[2:0]),
			    .Umbral_bajo	(Umbral_bajo[2:0]),
			    .clk		(clk),
			    .empties		(empties[7:0]),
			    .init		(init),
			    .reset		(reset));

endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End:
