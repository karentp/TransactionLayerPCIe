`timescale 1ns/1ns

module Probador_MUX(
    output reg clk,
    output reg state,
    output reg [9:0] P0, P1, P2, P3,
    input [9:0] Out0_conduct, Out1_conduct, Out2_conduct, Out3_conduct,
    input [9:0] Out0_estruct, Out1_estruct, Out2_estruct, Out3_estruct
);

initial clk=0;
always #2 clk=~clk;

initial begin
        $dumpfile("MUX.vcd");
        $dumpvars;
        state <= 4'b0001;
        P0<=10'b0000000000;
        P1<=10'b0000000000;
        P2<=10'b0000000000;
        P3<=10'b0000000000;
        @(posedge clk)
        @(posedge clk)
        @(posedge clk)
        state<=4'b0010;
        P0<=10'b0000000001;
        P1<=10'b0000000010;
        P2<=10'b0000000100;
        P3<=10'b0000001000;
        @(posedge clk)
        
        P0<=10'b0100000011;
        P1<=10'b0000000010;
        P2<=10'b0000000100;
        P3<=10'b0000001000;
        @(posedge clk)
        
        P0<=10'b0000000000;
        P1<=10'b1000000010;
        P2<=10'b0000000100;
        P3<=10'b0000001000;
        @(posedge clk)

        P0<=10'b0000000000;
        P1<=10'b0100010010;
        P2<=10'b0000000100;
        P3<=10'b0000001000;
        @(posedge clk)

        P0<=10'b0000000000;
        P1<=10'b0000000000;
        P2<=10'b1100100100;
        P3<=10'b0000001000;
        @(posedge clk)

        P0<=10'b0000000000;
        P1<=10'b0000000000;
        P2<=10'b1100010101;
        P3<=10'b0000001000;
        @(posedge clk)

        P0<=10'b0000000000;
        P1<=10'b0000000000;
        P2<=10'b0000000000;
        P3<=10'b0100001110;
        @(posedge clk)

        P0<=10'b0000000000;
        P1<=10'b0000000000;
        P2<=10'b0000000000;
        P3<=10'b1001101110;
        @(posedge clk)

        P0<=10'b0000000000;
        P1<=10'b0000000000;
        P2<=10'b0000000000;
        P3<=10'b0000000000;
        @(posedge clk)


        #25 $finish;

    end

endmodule
