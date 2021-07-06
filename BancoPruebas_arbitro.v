`timescale 	1ns				/ 100ps
`include "Probador_arbitro.v"
`include "cmos_cells.v"
`include "arbitro.v"
`include "arbitro_estruct.v"
//`include "arbitro_estruct.v"


module BancoPruebas_arbitro; // Testbench

    wire almost_full0,almost_full1,almost_full2,almost_full3;
    wire empty0_naranja,empty1_naranja,empty2_naranja,empty3_naranja, empty0_morado, empty1_morado ,empty2_morado,empty3_morado;
    wire [7:0] empties, empties_estruct;
    wire push0,push1,push2,push3;
    wire pop0,pop1,pop2,pop3;
    wire push0_estruct,push1_estruct,push2_estruct,push3_estruct;
    wire pop0_estruct,pop1_estruct,pop2_estruct,pop3_estruct;
    /*AUTOWIRE*/

    wire		clk;			// From prob of Probador_Contador.v
    wire [3:0] state;
    // End of automatics
    


    ///////////////////////////////// arbitro /////////////////////////
arbitro arbitro_conductual (
          .almost_full0(almost_full0),
          .almost_full1(almost_full1),
          .almost_full2(almost_full2),
          .almost_full3(almost_full3),  
          .empty0_naranja(empty0_naranja),
          .empty1_naranja(empty1_naranja),
          .empty2_naranja(empty2_naranja),
          .empty3_naranja(empty3_naranja),
          .empty0_morado(empty0_morado),
          .empty1_morado(empty1_morado),
          .empty2_morado(empty2_morado),
          .empty3_morado(empty3_morado),
          .push0(push0),
          .push1(push1),
          .push2(push2),
          .push3(push3),
          .pop0(pop0),
          .pop1(pop1),
          .pop2(pop2),
          .pop3(pop3),
          /*AUTOINST*/
			    // Outputs
			    .empties		(empties[7:0]),
			    // Inputs
			    .clk		(clk),
			    .state		(state[3:0]));


arbitro_estruct arbitro_estructural (
          .almost_full0(almost_full0),
          .almost_full1(almost_full1),
          .almost_full2(almost_full2),
          .almost_full3(almost_full3),  
          .empty0_naranja(empty0_naranja),
          .empty1_naranja(empty1_naranja),
          .empty2_naranja(empty2_naranja),
          .empty3_naranja(empty3_naranja),
          .empty0_morado(empty0_morado),
          .empty1_morado(empty1_morado),
          .empty2_morado(empty2_morado),
          .empty3_morado(empty3_morado),
          .push0(push0_estruct),
          .push1(push1_estruct),
          .push2(push2_estruct),
          .push3(push3_estruct),
          .pop0(pop0_estruct),
          .pop1(pop1_estruct),
          .pop2(pop2_estruct),
          .pop3(pop3_estruct),
          .empties(empties_estruct),
          /*AUTOINST*/
				     // Inputs
				     .clk		(clk),
				     .state		(state[3:0]));


Probador_arbitro Probador(
          .almost_full0(almost_full0),
          .almost_full1(almost_full1),
          .almost_full2(almost_full2),
          .almost_full3(almost_full3),  
          .empty0_naranja(empty0_naranja),
          .empty1_naranja(empty1_naranja),
          .empty2_naranja(empty2_naranja),
          .empty3_naranja(empty3_naranja),
          .empty0_morado(empty0_morado),
          .empty1_morado(empty1_morado),
          .empty2_morado(empty2_morado),
          .empty3_morado(empty3_morado),
          .push0(push0),
          .push1(push1),
          .push2(push2),
          .push3(push3),
          .pop0(pop0),
          .pop1(pop1),
          .pop2(pop2),
          .pop3(pop3),
          /*AUTOINST*/
			  // Outputs
			  .clk			(clk),
			  .state		(state[3:0]),
			  // Inputs
			  .empties		(empties[7:0]),
			  .empties_estruct	(empties_estruct[7:0]));







    
endmodule
// Local Variable:
   // eval:(verilog-read-defines)
   // eval:(verilog-read-includes)
   // End:
