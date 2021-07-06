`timescale 1ns/1ns

module Probador_arbitro(
    //FIFOS
    output reg clk,
    output reg [3:0] state,
    output reg empty0_naranja, empty1_naranja, empty2_naranja, empty3_naranja, empty0_morado, empty1_morado, empty2_morado, empty3_morado, 
    output reg almost_full0, almost_full1,almost_full2, almost_full3,
    input [7:0] empties, empties_estruct,
    input push0,push1,push2,push3,
    input pop0,pop1,pop2,pop3
);

initial clk=0;
always #2 clk=~clk;

initial begin
        $dumpfile("Arbitro.vcd");
        $dumpvars;
        empty0_naranja<=0;
        empty1_naranja<=0;
        empty2_naranja<=0;
        empty3_naranja<=0;
        empty0_morado<=0;
        empty1_morado<=0;
        empty2_morado<=0;
        empty3_morado<=0;
        almost_full0<=0;
        almost_full1<=0;
        almost_full2<=0;
        almost_full3<=0;
        state <= 4'b0001;
        @(posedge clk)
        @(posedge clk)
        state<=4'b0010;
        @(posedge clk)

//recordar que hay una lógica de muxes de por medio que selecciona a cual morado enviar, aquí se envia al dedillo
 ///interaccion1
        @(posedge clk)
        empty0_naranja<=1;
        empty1_naranja<=0;
        empty2_naranja<=0;
        empty3_naranja<=0;
        //el baseado del naranja 1 me llenará el morado 2
        @(posedge clk)
        almost_full0<=0;
        almost_full1<=1;
        almost_full2<=0;
        almost_full3<=0;
 ///interaccion2
        @(posedge clk)
        empty0_naranja<=1;
        empty1_naranja<=1;
        empty2_naranja<=0;
        empty3_naranja<=0;
        //el baseado del naranaja 2 me llenará el morado 1
        @(posedge clk)
        almost_full0<=1;
        almost_full0<=0;
        almost_full0<=0;
        almost_full0<=0;

 ///interaccion3
        @(posedge clk)
        empty0_naranja<=1;
        empty1_naranja<=1;
        empty2_naranja<=1;
        empty3_naranja<=0;
        //el baseado del naranja 3 me llenará el morado 3
        @(posedge clk)
        almost_full0<=0;
        almost_full0<=0;
        almost_full0<=1;
        almost_full0<=0;

 ///interaccion4
        @(posedge clk)
        empty0_naranja<=1;
        empty1_naranja<=1;
        empty2_naranja<=1;
        empty3_naranja<=1;
        //el baseado del ultimo naranja 4 me llenará el morado 4
        @(posedge clk)
        almost_full0<=0;
        almost_full0<=0;
        almost_full0<=0;
        almost_full0<=1;

 ///interaccion5
        @(posedge clk)
        empty0_naranja<=0;
        empty1_naranja<=0;
        empty2_naranja<=0;
        empty3_naranja<=0;
        //el baseado del ultimo naranja 4 me llenará el morado 4
        @(posedge clk)
        almost_full0<=0;
        almost_full1<=0;
        almost_full2<=0;
        almost_full3<=0;
        @(posedge clk)
        empty0_naranja<=0;
        empty1_naranja<=0;
        empty2_naranja<=0;
        empty3_naranja<=0;
        //el baseado del ultimo naranja 4 me llenará el morado 4
        @(posedge clk)
        almost_full0<=0;
        almost_full1<=0;
        almost_full2<=0;
        almost_full3<=0;
        @(posedge clk)
        empty0_naranja<=0;
        empty1_naranja<=0;
        empty2_naranja<=0;
        empty3_naranja<=0;
        //el baseado del ultimo naranja 4 me llenará el morado 4
        @(posedge clk)
        almost_full0<=0;
        almost_full1<=0;
        almost_full2<=0;
        almost_full3<=0;

//trampas

        @(posedge clk)
        empty0_naranja<=1;
        empty1_naranja<=0;
        empty2_naranja<=1;
        empty3_naranja<=0;

        @(posedge clk)
        empty0_naranja<=1;
        empty1_naranja<=1;
        empty2_naranja<=0;
        empty3_naranja<=1;

        #25 $finish;

    end

endmodule
