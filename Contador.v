module Contador (
    input [9:0] data_FIFO_0,
    input [9:0] data_FIFO_1,
    input [9:0] data_FIFO_2,
    input [9:0] data_FIFO_3,
    input req,
    input clk,
    input [3:0] state,
    input [1:0] idx,
    output reg valid,
    output reg [4:0] data_out
);

reg [4:0] contador_0, contador_1, contador_2, contador_3;

// Lógica de conteo de FIFOS
always @(posedge clk)begin
    if(state == 4'b0001)begin       //Estado de RESET -> reinicia contadores
        contador_0 <= 5'b00000;
        contador_1 <= 5'b00000;
        contador_2 <= 5'b00000;
        contador_3 <= 5'b00000;
    end
    else begin

        if (data_FIFO_0 != 10'b0)begin
            contador_0 <= contador_0 + 1;
        end
        if (data_FIFO_1 != 10'b0)begin
            contador_1 <= contador_1 + 1;
        end
        if (data_FIFO_2 != 10'b0)begin
            contador_2 <= contador_2 + 1;
        end
        if (data_FIFO_3 != 10'b0)begin
            contador_3 <= contador_3 + 1;
        end

    end
end

// Lógica de lectura de contadores
always @(posedge clk)begin

    if(state == 4'b0001)begin
        data_out = 5'b0;
        valid = 0;
    end
    else begin
        if((state == 4'b0100) & (req == 1))begin    // IDLE = 0100
            if(idx == 2'b00)begin
                data_out = contador_0;
                valid = 1;
            end
            if(idx == 2'b01)begin
                data_out = contador_1;
                valid = 1;
            end
            if(idx == 2'b10)begin
                data_out = contador_2;
                valid = 1;
            end
            if(idx == 2'b11)begin
                data_out = contador_3;
                valid = 1;
            end
        end
        else begin
            valid = 0;
        end
    end
end

endmodule
