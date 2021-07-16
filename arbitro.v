module arbitro(
    input clk,
    input almost_full0,
    input almost_full1,
    input almost_full2,
    input almost_full3,
    input [3:0] state,
    input empty0_naranja,
    input empty1_naranja,
    input empty2_naranja,
    input empty3_naranja,
    input empty0_morado,
    input empty1_morado,
    input empty2_morado,
    input empty3_morado,
    output reg push,
    // output reg push1,
    // output reg push2,
    // output reg push3,
    output reg pop0,
    output reg pop1,
    output reg pop2,
    output reg pop3,
    output reg [7:0] empties
);

always@(posedge clk)begin
    if(state == 4'b0001)begin
        push <= 0;
    end
    else begin
        push <= 1;
    end

end
//Lógica de prioridades

always@(*)begin
    if(state == 4'b0001)begin
        pop0=0;
        pop1=0;
        pop2=0;
        pop3=0;
        // push=1;
        // push1=1;
        // push2=1;
        // push3=1;
    end
    else begin

        if(almost_full0 | almost_full1 | almost_full2 | almost_full3)begin          
            pop0=0;
            pop1=0;
            pop2=0;
            pop3=0; 
        end
        else begin 
        // push=1;
            //logica de cambio de fifo
            //logica del pop por los siglos de los siglos 
        if (empty0_naranja ==0 )begin           //if logica pops naranjas      
            pop0=1;
            pop1=0;
            pop2=0;
            pop3=0;
        end
        else begin 
            if (empty1_naranja == 0  )begin           //if logica pops naranjas      
                pop0=0;
                pop1=1;
                pop2=0;
                pop3=0;
            end
            else begin 
                if (empty2_naranja==0 )begin           //if logica pops naranjas      
                    pop0=0;
                    pop1=0;
                    pop2=1;
                    pop3=0;
                end
                else begin 
                    if (empty3_naranja==0 )begin           //if logica pops naranjas      
                        pop0=0;
                        pop1=0;
                        pop2=0;
                        pop3=1;
                    end 
                    else begin 
                        pop0=0;
                        pop1=0;
                        pop2=0;
                        pop3=0;          
                    end
                end
            end
        end
    // end

    //logica de fifos morados
    // if(almost_full0 | almost_full1 | almost_full2 | almost_full3)begin          
    //     // push=0;
    //     // push1=0;
    //     // push2=0;
    //     // push3=0;
    // end
    // else begin 
        // push=1;
        // push1=1;
        // push2=1;
        // push3=1;
    end
    end
end


//encapsulamiento de los empties para eventual entrada de FSM
always@(*)begin
     if(state== 4'b0001)begin
       empties<=8'b00000000;  
     end
     else begin
        empties[0] = empty0_naranja;
        empties[1] = empty1_naranja;
        empties[2] = empty2_naranja;
        empties[3] = empty3_naranja;
        empties[4] = empty0_morado;
        empties[5] = empty1_morado;
        empties[6] = empty2_morado;
        empties[7] = empty3_morado;
     end
end

endmodule