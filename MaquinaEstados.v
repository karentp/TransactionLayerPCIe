module MaquinaEstados (
    input clk,
    input [2:0] Umbral_alto, Umbral_bajo,
    input reset,
    input init,
    input [7:0] empties,
    output reg [2:0] umbral_superior, umbral_inferior,
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
        umbral_superior<=0;
        umbral_inferior<=0;
    end
    else begin
        if (init)begin
            Estado <= INIT;
            umbral_superior <= Umbral_alto;
            umbral_inferior <= Umbral_bajo;
        end
        else begin
            Estado <= ProximoEstado;
        end
    end
end

always@(*)begin
    
    if(reset)begin
        state = RESET;
        ProximoEstado = 0;
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
            ProximoEstado = IDLE;
        end

        //      *** IDLE ***       //
        IDLE: begin
            if(empties != 8'hFF)begin
                ProximoEstado = ACTIVE;
            end
            else begin
                ProximoEstado = IDLE;
            end
        end

        //      *** ACTIVE ***       //
        ACTIVE: begin
            if(empties != 8'hFF)begin
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
