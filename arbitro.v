module arbitro(
    input clk,
    input almost_full,
    input reset_L,
    input almost_empty,
    input push_probador_naranja,
    output push,
    output reg pop
);
//reg [2:0] analisis_tamaño;
reg [1:0] FIFO_actual; //fifo 00 fifo 01 fifo 10 fifo 11
reg [2:0] contador0;//contar hasta 8
reg [2:0] contador1;//contar hasta 8
reg [2:0] contador2;//contar hasta 8
reg [2:0] contador3;//contar hasta 8
reg empty;

//Lógica de prioridades

always@(posedge clk)begin
    if(reset_L)begin
        empty<=0;
        FIFO_actual<=2'b00;
        contador0<=3'b000;
        contador1<=3'b000;
        contador2<=3'b000;
        contador3<=3'b000;
        pop<=0;
    end
    else begin

        //logica de cambio de fifo
        if(FIFO_actual==2'b00)begin
            //logica del pop por los siglos de los siglos 
            if(contador0 !=0)begin
                 pop<=1;
            end


            if(push_probador_naranja)begin
                contador0<=contador0+1;// se hizo un push en el fifo actual en el que estamos
            end
            if(pop)begin
                contador0<=contador0-1;//se hizo un pop en el fifo (el arbitro siempre hace pop mientras sea algo válido de hacer segun lo planeado)
            end
            if (almost_empty)begin            
                if(contador0==0)begin
                    empty<=1;
                    FIFO_actual<=2'b01;
                end
            end
        end


        if(FIFO_actual==2'b01)begin
            //logica del pop por los siglos de los siglos 
            if(contador1 !=0)begin
                 pop<=1;
            end

            if(push_probador_naranja)begin
                contador1<=contador1+1;// se hizo un push en el fifo actual en el que estamos
            end
            if(pop)begin
                contador1<=contador1-1;//se hizo un pop en el fifo (el arbitro siempre hace pop mientras sea algo válido de hacer segun lo planeado)
            end
            if (almost_empty)begin            
                if(contador1==0)begin
                    empty<=1;
                    FIFO_actual<=2'b10;
                end
            end
        end


        if(FIFO_actual==2'b10)begin
            //logica del pop por los siglos de los siglos 
            if(contador2 !=0)begin
                 pop<=1;
            end

            if(push_probador_naranja)begin
                contador2<=contador2+1;// se hizo un push en el fifo actual en el que estamos
            end
            if(pop)begin
                contador2<=contador2-1;//se hizo un pop en el fifo (el arbitro siempre hace pop mientras sea algo válido de hacer segun lo planeado)
            end
            if (almost_empty)begin            
                if(contador2==0)begin
                    empty<=1;
                    FIFO_actual<=2'b11;
                end
            end
        end


        if(FIFO_actual==2'b11)begin
            //logica del pop por los siglos de los siglos 
            if(contador3 !=0)begin
                 pop<=1;
            end

            if(push_probador_naranja)begin
                contador3<=contador3+1;// se hizo un push en el fifo actual en el que estamos
            end
            if(pop)begin
                contador3<=contador3-1;//se hizo un pop en el fifo (el arbitro siempre hace pop mientras sea algo válido de hacer segun lo planeado)
            end
            if (almost_empty)begin            
                if(contador3==0)begin
                    empty<=1;
                    FIFO_actual<=2'b00;
                end
            end
        end



    end
end

endmodule