`timescale 1ns/1ns

module Probador(
    output reg clk,
    output reg reset,
    output reg push,
    output reg pop,
    output reg [9:0] data_in,
    input [9:0] data_out,
    input almost_full, almost_empty
);

initial clk=0;
always #2 clk=~clk;

initial begin
        $dumpfile("contador.vcd");
        $dumpvars;
        
        reset <= 0;
        @(posedge clk)
        reset<=1;
        data_in<=10'b000000000;
        
        push<=1;
        pop<=0;
        repeat(9)begin
        @(posedge clk)
        data_in <= data_in + 1;
        end

        push<=0;
        pop<=1;
        repeat(11)begin
        @(posedge clk)
        data_in <= data_in + 1;
        end

        @(posedge clk)
        data_in <= data_in + 1;
        @(posedge clk)
        data_in <= data_in + 1;

        push<=1;
        pop<=1;
        repeat(3)begin
         @(posedge clk)
        data_in <= data_in + 1;
        end

        push<=1;
        pop<=0;
        repeat(3)begin
         @(posedge clk)
        data_in <= data_in + 1;
        end

        #25 $finish;

    end

endmodule
