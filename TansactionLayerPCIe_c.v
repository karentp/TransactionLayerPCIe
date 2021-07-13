`include "FIFO.v"
`include "MUX.v"
`include "Contador.v"
`include "arbitro.v"
`include "MaquinaEstados.v"

module TransactionLayerPCIe_c(
    input clk,
    input req,
    input [1:0] idx,
    input [9:0] data_in0, data_in1, data_in2, data_in3,
    input reset, init,
    input [2:0] Umbral_bajo, Umbral_alto,
    input push_in0, push_in1, push_in2, push_in3,
    input pop_in0, pop_in1, pop_in2, pop_in3,
    output reg [9:0] data_out0, data_out1, data_out2, data_out3,
    output reg [4:0] contador,
    output reg valid,
);

wire pop_Ar0, pop_Ar1, pop_Ar2, pop_Ar3; 
wire push_Ar0, push_Ar1, push_Ar2, push_Ar3;

wire almost_full0, almost_full1, almost_full2, almost_full3;
wire empty0, empty1, empty2, empty3, empty4, empty5, empty6, empty7;

reg [9:0] inFIFO_out0, inFIFO_out1, inFIFO_out2, inFIFO_out3;
reg [9:0] outFIFO_in0, outFIFO_in1, outFIFO_in2, outFIFO_in3,

/*AUTOWIRE*/

//------------------------------------- FIFOS de entrada -------------------------------//
FIFO FIFO_in0( 
    .push(push_in0),
    .pop(pop_Ar0),
    .data_in(outFIFO_in0),
    .data_out(data_out0),
    .almost_full(almost_full0),
    .empty(empty0)
    /*AUTOINST*/
);
FIFO FIFO_in1( 
    .push(push_in1),
    .pop(pop_Ar1),
    .data_in(data_in1),
    .data_out(outFIFO_in1),
    .almost_full(almost_full1),
    .empty(empty1)
    /*AUTOINST*/
);
FIFO FIFO_in2( 
    .push(push_in2),
    .pop(pop_Ar2),
    .data_in(data_in2),
    .data_out(outFIFO_in2),
    .almost_full(almost_full2),
    .empty(empty2)
    /*AUTOINST*/
);
FIFO FIFO_in3( 
    .push(push_in3),
    .pop(pop_Ar3),
    .data_in(data_in3),
    .data_out(outFIFO_in3),
    .almost_full(almost_full3),
    .empty(empty3)
    /*AUTOINST*/
);


//------------------------------------- FIFOS de salida -------------------------------//

FIFO FIFO_out0( 
    .push(push_Ar0),
    .pop(pop_in0),
    .data_in(inFIFO_out0),
    .data_out(data_out0),
    .empty(empty4),
    /*AUTOINST*/
);
FIFO FIFO_out1( 
    .push(push_Ar1),
    .pop(pop_in1),
    .data_in(inFIFO_out1),
    .data_out(data_out1),
    .empty(empty5),
    /*AUTOINST*/
);
FIFO FIFO_out2( 
    .push(push_Ar2),
    .pop(pop_in2),
    .data_in(inFIFO_out2),
    .data_out(data_out2),
    .empty(empty6),
    /*AUTOINST*/
);
FIFO FIFO_out3( 
    .push(push_Ar3),
    .pop(pop_in3),
    .data_in(inFIFO_out3),
    .data_out(data_out3),
    .empty(empty7),
    /*AUTOINST*/
);

//------------------------------------- MUXES -------------------------------//

MUX multiplexores(
    .P0(outFIFO_in0),
    .P1(outFIFO_in1),
    .P2(outFIFO_in2),
    .P3(outFIFO_in3),
    .Out0(inFIFO_out0),
    .Out1(inFIFO_out1),
    .Out2(inFIFO_out2),
    .Out3(inFIFO_out3),
    /*AUTOINST*/
);


//------------------------------------- Contadores -------------------------------//





endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End:
