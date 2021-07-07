`include "true_dpram_sclk.v"

module FIFO (
    input clk,
    input [3:0] state,                            // Estado proveniente de la SM
    input push,
    input pop,
    input [9:0] data_in,
    input [2:0] umbral_superior,            // Umbral de almost full
    input [2:0] umbral_inferior,            // Umbral de almost empty
    output [9:0] data_out,
    output reg almost_full,
    output reg almost_empty, empty
);

reg [2:0] wr_ptr, rd_ptr;
reg [2:0] low_space, much_space;
reg we_a, re_a;
reg [2:0] contador;
reg full, empty_aux;

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
    if(state == 4'b0001)begin 
        low_space <= 0;
        much_space <= 0;
    end  
    if(state == 4'b0010)begin
        low_space <= umbral_superior;
        much_space <= umbral_inferior;
    end
end

always@(posedge clk)begin
    // Estado de RESET = 0001
    if(state == 4'b0001)begin
        wr_ptr <= 3'b0;
        rd_ptr <= 3'b0;
        contador <= 3'b0;
        full <= 0;
        empty_aux <= 1;
        empty <= 1;
        // low_space <= 2'b00;
        // much_space <= 2'b00;
    end
    // if(state == 4'b0010)begin
    //         low_space <= umbral_superior;
    //         much_space <= umbral_inferior;
    //     end
    else begin
        //  Lógica para hacer push
        if((push == 1) & (full==0))begin
            wr_ptr <= wr_ptr + 1; 
            contador <= contador + 1;
            empty_aux <=0;
            empty <= 0;

            if(contador == 3'b111)begin
                full <= 1;
                contador <= 3'b111;
            end
        end

        // Lógica para hacer pop
        if((pop == 1)  & (empty_aux==0))begin
            rd_ptr <= rd_ptr + 1; 
            contador <= contador - 1;
            full <= 0;
            
            if(contador == 3'b000)begin
                empty_aux <= 1;
                empty <= 1;
                contador <= 3'b000;
            end
        end
    end
end

always@(*)begin
    // Estado de RESET = 0001
    if(state == 4'b0001)begin
        we_a <= 0;
        re_a <= 0;
        // empty = 1;
    end
    else begin

        //  Lógica para hacer push
        if((push == 1) & (full==0))begin
            we_a <= 1;
            // empty = empty_aux;
        end
        else if(we_a <= 1)begin
            we_a <= 0;
            // empty = empty_aux;
        end

        // Lógica para hacer pop
        if((pop == 1) & (empty_aux==0))begin
            re_a <= 1;
            // empty = empty_aux;
        end
        else if(re_a <= 1)begin
            re_a <= 0;
            // empty = empty_aux;
        end
    end
end

always@(*)begin

    // Estado de RESET = 0001
    if(state==4'b0001)begin
        almost_full = 0;
        almost_empty = 0;
        // low_space = 2'b00;
        // much_space = 2'b00;
    end
    else begin
        
        // Estado de INIT = 0010
        // if(state == 4'b0010)begin
        //     low_space = umbral_superior;
        //     much_space = umbral_inferior;
        // end

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