`include "true_dpram_sclk.v"

module FIFO (
    input clk,
    input state,                            // Estado proveniente de la SM
    input push,
    input pop,
    input [9:0] data_in,
    input [2:0] umbral_superior,            // Umbral de almost full
    input [2:0] umbral_inferior,            // Umbral de almost empty
    output [9:0] data_out,
    output reg almost_full, almost_empty
);

reg [2:0] wr_ptr, rd_ptr;
reg [2:0] low_space, much_space;
reg we_a, re_a;
reg [2:0] contador;
reg full, empty;

true_dpram_sclk memory (
                .data_a(data_in),
                .addr_wa(wr_ptr),
                .addr_ra(rd_ptr),
                .clk(clk),
                .we_a(we_a),
                .re_a(re_a),
                .q_a(data_out),
                .state(state)
);

always@(posedge clk)begin
    if(state == 0)begin
        wr_ptr <= 3'b0;
        rd_ptr <= 3'b0;
        contador <= 3'b0;
        full <= 0;
        empty <= 0;
    end
    else begin
        //  Lógica para hacer push
        if((push == 1) & (contador <= 3'b111) & (full==0))begin
            wr_ptr <= wr_ptr + 1; 
            contador <= contador + 1;
            empty <=0;

            if(contador == 3'b111)begin
                full <= 1;
                contador <= 3'b111;
            end
        end

        // Lógica para hacer pop
        if((pop == 1) & (contador >= 3'b000) & (empty==0))begin
            rd_ptr <= rd_ptr + 1; 
            contador <= contador - 1;
            full <= 0;
            
            if(contador == 3'b000)begin
                empty <= 1;
                contador <= 3'b000;
            end
        end
    end
end

always@(*)begin
    if(state == 0)begin
        we_a <= 0;
        re_a <= 0;
    end
    else begin

        //  Lógica para hacer push
        if((push == 1) & (contador < 3'b111))begin
            we_a <= 1;
        end
        else if(we_a <= 1)begin
            we_a <= 0;
        end

        // Lógica para hacer pop
        if((pop == 1) & (contador > 3'b000))begin
            re_a <= 1;
        end
        else if(re_a <= 1)begin
            re_a <= 0;
        end
    end
end

always@(*)begin

    if(state==0)begin
        almost_full = 0;
        almost_empty = 0;
        low_space = umbral_superior;
        much_space = umbral_inferior;
    end
    else begin
        // Lógica de casi lleno y casi vacío
        if(contador >= low_space)begin
            almost_full = 1;
        end
        else begin
            almost_full = 0;
        end
        if(contador <= much_space)begin
            almost_empty = 1;
        end
        else begin
            almost_empty = 0;
        end
    end
end

endmodule