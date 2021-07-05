`timescale 1ns/1ns

module Probador_Contador(
    //FIFOS
    output reg clk,
    output reg [3:0] state,
    output reg push_0, push_1, push_2, push_3,
    output reg pop,
    output reg [9:0] data_in_0, data_in_1, data_in_2, data_in_3,
    output reg [2:0] umbral_superior,            // Umbral de almost full
    output reg [2:0] umbral_inferior,            // Umbral de almost empty
    // input [9:0] data_out_conduct,
    // input [9:0] data_out_estruct,
    // input almost_full_conduct, almost_empty_conduct,
    // input almost_full_estruct, almost_empty_estruct,

    // Contadores
    output reg req,
    output reg [1:0] idx,
    input valid_c, valid_e,
    input [4:0] data_out_c,
    input [4:0] data_out_e
);

initial clk=0;
always #2 clk=~clk;

initial begin
        $dumpfile("Contador.vcd");
        $dumpvars;
        push_0<=0;
        push_1<=0;
        push_2<=0;
        push_3<=0;
        req<=0;
        idx <= 0;
        pop<=0;
        umbral_inferior <= 3'b001;
        umbral_superior <= 3'b110;
        state <= 4'b0001;
        @(posedge clk)
        @(posedge clk)
        state<=4'b0010;
        data_in_0<=10'b0000000001;
        data_in_1<=10'b0000000100;
        data_in_2<=10'b0000100000;
        data_in_3<=10'b0100000000;
        @(posedge clk)
        push_0<=1;
        push_1<=1;
        push_2<=1;
        push_3<=1;
        pop<=0;


        repeat(8) begin
            @(posedge clk)
            push_0<=0;
            data_in_1 <= data_in_1 + 1;
            data_in_2 <= data_in_2 + 1;
            data_in_3 <= data_in_3 + 1;
        end

        req<=1;
        push_0<=0;
        push_1<=0;
        push_2<=0;
        push_3<=0;
        pop<=1;
        repeat(8)begin
            @(posedge clk);
        end

        // push_0<=1;
        // push_1<=1;
        push_2<=1;
        push_3<=1;
        pop<=0;
        repeat(7)begin
            @(posedge clk)
            data_in_2 <= data_in_2 + 1;
            data_in_3 <= data_in_3 + 1;
        end

        req<=0;
        push_0<=0;
        push_1<=0;
        push_2<=0;
        push_3<=0;
        pop<=1;
        repeat(8)begin
            @(posedge clk);
        end

        // push_0<=1;
        // push_1<=1;
        // push_2<=1;
        push_3<=1;
        pop<=0;
        repeat(6)begin
            @(posedge clk)
            data_in_3 <= data_in_3 + 1;
        end

        push_0<=0;
        push_1<=0;
        push_2<=0;
        push_3<=0;
        pop<=1;
        repeat(8)begin
            @(posedge clk);
        end

        state <= 4'b0100;
        @(posedge clk)

        req<=1;
        idx <= 0;

        @(posedge clk)
        req<=1;
        idx <= 2'b01;
        @(posedge clk)
        req<=1;
        idx <= 2'b10;
        @(posedge clk)
        req<=1;
        idx <= 2'b11;

        @(posedge clk)
        @(posedge clk)

        #25 $finish;

    end

endmodule
