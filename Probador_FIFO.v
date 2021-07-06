`timescale 1ns/1ns

module Probador_FIFO(
    output reg clk,
    output reg [3:0] state,
    output reg push,
    output reg pop,
    output reg [9:0] data_in,
    output reg [2:0] umbral_superior,            // Umbral de almost full
    output reg [2:0] umbral_inferior,            // Umbral de almost empty
    input [9:0] data_out_conduct,
    input [9:0] data_out_estruct,
    input almost_full_conduct,
    input almost_full_estruct,
    input empty_conduct, empty_estruct
);

initial clk=0;
always #2 clk=~clk;

initial begin
        $dumpfile("FIFO.vcd");
        $dumpvars;
        push<=0;
        pop<=0;
        umbral_inferior <= 3'b001;
        umbral_superior <= 3'b110;
        state <= 4'b0001;
        @(posedge clk)
        @(posedge clk)
        state<=4'b0010;
        data_in<=10'b0000000001;
        @(posedge clk)
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
        repeat(5)begin
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
