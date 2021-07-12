module MUX(
    input clk,
    input state,
    input [9:0] P0, P1, P2, P3,
    output reg[9:0] Out0, Out1, Out2, Out3
);

reg [9:0] CanalMedio;
reg [1:0] dest;


// Entradas
always@(*)begin
    if(state == 4'b0001)begin
        CanalMedio = 10'b0;
    end
    else begin
        if(P0 != 10'b0)begin
            CanalMedio = P0;
        end
        else begin
            if(P1 != 10'b0)begin
                CanalMedio = P1;
            end
            else begin
                if(P2 != 10'b0)begin
                    CanalMedio = P2;
                end
                else begin
                    if(P3 != 10'b0)begin
                        CanalMedio = P3;
                    end
                    else begin
                        CanalMedio = 10'b0;
                    end
                end
            end
        end
    end
end


// Dirección
always@(posedge clk)begin
    if(state == 4'b0001)begin
        dest = 2'b0;
    end
    else begin
        dest = CanalMedio[9:8];
    end
end


// Salidas
always@(*)begin
    if(state == 4'b0001)begin
        Out0 = 10'b0;
        Out1 = 10'b0;
        Out2 = 10'b0;
        Out3 = 10'b0;
    end
    else begin
        if(CanalMedio != 10'b0)begin
            case(dest)
            0: begin
                Out0 = CanalMedio;
                Out1 = 10'b0;
                Out2 = 10'b0;
                Out3 = 10'b0;
            end

            1: begin
                Out1 = CanalMedio;
                Out0 = 10'b0;
                Out2 = 10'b0;
                Out3 = 10'b0;
            end

            2: begin
                Out2 = CanalMedio;
                Out0 = 10'b0;
                Out1 = 10'b0;
                Out3 = 10'b0;
            end

            3: begin
                Out3 = CanalMedio;
                Out0 = 10'b0;
                Out1 = 10'b0;
                Out2 = 10'b0;
            end
            endcase
        end
        else begin
            Out0 = 10'b0;
            Out1 = 10'b0;
            Out2 = 10'b0;
            Out3 = 10'b0;
        end
    end
end

endmodule
