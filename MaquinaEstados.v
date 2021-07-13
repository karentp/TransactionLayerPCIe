module MaquinaEstados (
    input clk,
    input [2:0] Umbral_alto, Umbral_bajo,
    input reset,
    input init,
    input [7:0] Empties,
    output reg [2:0] Umbral_superior, Umbral_inferior,
    output reg [3:0] state
);
reg [3:0] ProximoEstado, Estado;

parameter [3:0] RESET = 4'b0001;
parameter [3:0] INIT = 4'b0010;
parameter [3:0] IDLE = 4'b0100;
parameter [3:0] ACTIVE = 4'b1000;

always@(posedge clk)begin
    if (reset)begin
        Estado <= RESET;
        Umbral_superior<=0;
        Umbral_inferior<=0;
        // state <= 0;
        // ProximoEstado <= 0;
    end
    else begin
        if (init)begin
            Estado <= INIT;
        end
        else begin
            Estado <= ProximoEstado;
            if(Estado == INIT)begin
                Umbral_superior <= Umbral_alto;
                Umbral_inferior <= Umbral_bajo;
            end
        end
    end
end

always@(*)begin
    
    if(reset)begin
        state = 0;
        ProximoEstado = 0;
        // Umbral_superior=0;
        // Umbral_inferior=0;
    end
    else begin
    state = Estado;
    ProximoEstado = Estado;
    case(Estado)

        //      *** RESET ***       //
        RESET: begin
            ProximoEstado = INIT;
        end


        //      *** INIT ***       //
        INIT: begin
            // Umbral_superior = Umbral_alto;
            // Umbral_inferior = Umbral_bajo;
            ProximoEstado = IDLE;
        end

        //      *** IDLE ***       //
        IDLE: begin
            if(Empties != 8'b0)begin
                ProximoEstado = ACTIVE;
            end
            else begin
                ProximoEstado = IDLE;
            end
        end

        //      *** ACTIVE ***       //
        ACTIVE: begin
            if(Empties != 8'b0)begin
                ProximoEstado = ACTIVE;
            end
            else begin
                ProximoEstado = IDLE;
            end
        end

    endcase
    end
end

endmodule
