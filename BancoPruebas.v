`timescale 	1ns				/ 100ps
`include "TransactionLayerPCIe_c.v"
`include "Probador.v"
`include "TransactionLayerPCIe_e.v"


module BancoPruebas; // Testbench

    /*AUTOWIRE*/

    TransactionLayerPCIe_c conductual (
        /*AUTOINST*/);

	Probador testbench (
        /*AUTOINST*/);

    TransactionLayerPCIe_e estructural (
        /*AUTOINST*/);
    
endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End:
