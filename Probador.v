module Probador(
    output reg clk,
    output reg req,
    output reg [1:0] idx,
    output reg [9:0] data_in0, data_in1, data_in2, data_in3,
    output reg reset, init,
    output reg [2:0] Umbral_bajo, Umbral_alto,
    output reg push_in0, push_in1, push_in2, push_in3,
    output reg pop_in0, pop_in1, pop_in2, pop_in3,

    input [9:0] data_out0_c, data_out1_c, data_out2_c, data_out3_c,
    input [9:0] data_out0_e, data_out1_e, data_out2_e, data_out3_e,
    input [4:0] contador_c, contador_e,
    input valid_c, valid_e
);

reg Checker_data_out;

initial clk <= 1'b0;
always #10 clk <= ~clk;

initial begin
    $dumpfile("Completo.vcd");
    $dumpvars();
    
    req <= 0;
    idx <= 2'b00;
    data_in0 <= 10'b0000000000;
    data_in1 <= 10'b0000000000;
    data_in2 <= 10'b0000000000;
    data_in3 <= 10'b0000000000;
    reset <= 1;
    init <= 0;
    Umbral_bajo <= 3'b000;
    Umbral_alto <= 3'b000;
    push_in0 <= 0;
    push_in1 <= 0;
    push_in2 <= 0;
    push_in3 <= 0;
    pop_in0 <= 0;
    pop_in1 <= 0;
    pop_in2 <= 0;
    pop_in3 <= 0;
    @(posedge clk);

    // 1. Saque el bloque de RESET, manteniendo el estado de INIT (señal init)

    reset <= 1;
    init <= 1;
    @(posedge clk);
    reset <= 0;
    init <= 1;
    @(posedge clk);

    // 2. Modifique 2 veces los umbrales altos y bajos de los FIFOs (son el mismo umbral bajo
    // y alto para todos). Libere la señal init.

    Umbral_bajo <= 3'b000;
    Umbral_alto <= 3'b111;
    @(posedge clk);
    Umbral_bajo <= 3'b001;
    Umbral_alto <= 3'b110;
    @(posedge clk);
    reset <= 0;
    init <= 0;
    @(posedge clk);

    // 3. Provoque un Almost Full en todos los FIFOs de salida, el árbitro no le permitirá hacerlo 
    // de forma simultánea. Desde el probador, haga la menor cantidad de POPs. Verifique que las
    // palabras que salieron son las mismas que entraron y que salieron por la salida correcta 
    // en la prioridad correcta.

    push_in0 <= 1;
    push_in1 <= 1;
    push_in2 <= 1;
    push_in3 <= 1;
    data_in0 <= 10'b0000000001;
    data_in1 <= 10'b0100000010;
    data_in2 <= 10'b1000000100;
    data_in3 <= 10'b1100001000;
    @(posedge clk);
    push_in0 <= 0;
    push_in1 <= 1;
    push_in2 <= 0;
    push_in3 <= 1;

    @(posedge clk);
    push_in0 <= push_in0 + 1;
    push_in1 <= push_in1 + 1;
    push_in2 <= push_in2 + 1;
    push_in3 <= push_in3 + 1;

    data_in0 <= data_in0 + 1;
    data_in1 <= data_in1 + 1;
    data_in2 <= data_in2 + 1;
    data_in3 <= data_in3 + 1;

    @(posedge clk);
    push_in0 <= push_in0 + 1;
    push_in1 <= push_in1 + 1;
    push_in2 <= push_in2 + 1;
    push_in3 <= push_in3 + 1;

    @(posedge clk);
    push_in0 <= push_in0 + 1;
    push_in1 <= push_in1 + 1;
    push_in2 <= push_in2 + 1;
    push_in3 <= push_in3 + 1;

    data_in0 <= data_in0 + 1;
    data_in1 <= data_in1 + 1;
    data_in2 <= data_in2 + 1;
    data_in3 <= data_in3 + 1;

    @(posedge clk);
    push_in0 <= push_in0 + 1;
    push_in1 <= push_in1 + 1;
    push_in2 <= push_in2 + 1;
    push_in3 <= push_in3 + 1;

    @(posedge clk);
    push_in0 <= push_in0 + 1;
    push_in1 <= push_in1 + 1;
    push_in2 <= push_in2 + 1;
    push_in3 <= push_in3 + 1;

    data_in0 <= data_in0 + 1;
    data_in1 <= data_in1 + 1;
    data_in2 <= data_in2 + 1;
    data_in3 <= data_in3 + 1;

    
    
    @(posedge clk);
    push_in0 <= push_in0 + 1;
    push_in1 <= push_in1 + 1;
    push_in2 <= push_in2 + 1;
    push_in3 <= push_in3 + 1;

    @(posedge clk);
    push_in0 <= push_in0 + 1;
    push_in1 <= push_in1 + 1;
    push_in2 <= push_in2 + 1;
    push_in3 <= push_in3 + 1;

    data_in0 <= data_in0 + 1;
    data_in1 <= data_in1 + 1;
    data_in2 <= data_in2 + 1;
    data_in3 <= data_in3 + 1;

    @(posedge clk);
    push_in0 <= push_in0 + 1;
    push_in1 <= push_in1 + 1;
    push_in2 <= push_in2 + 1;
    push_in3 <= push_in3 + 1;

    @(posedge clk);
    push_in0 <= push_in0 + 1;
    push_in1 <= push_in1 + 1;
    push_in2 <= push_in2 + 1;
    push_in3 <= push_in3 + 1;

    data_in0 <= data_in0 + 1;
    data_in1 <= data_in1 + 1;
    data_in2 <= data_in2 + 1;
    data_in3 <= data_in3 + 1;

    

    @(posedge clk);
    data_in0 <= 10'b0000000000;
    data_in1 <= 10'b0000000000;
    data_in2 <= 10'b0000000000;
    data_in3 <= 10'b0000000000;
    @(posedge clk);
    @(posedge clk); 
    @(posedge clk);

    pop_in0 <=1;
    
    @(posedge clk);
    pop_in0 <=0;
    pop_in1 <=1;
    @(posedge clk);
    pop_in1 <=0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    pop_in2 <=1;
    @(posedge clk);
    pop_in2 <=0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);

    // 4. Provoque un Almost Full en todos los FIFOs de entrada. Luego usando POPs del probador
    // deje todos los FIFOs vacíos. Verifique que las palabras que salieron son las mismas que
    // entraron y que salieron por la salida correcta en la prioridad correcta.
    // 5. Lea los contadores de palabras.

    push_in0 <= 1;
    push_in1 <= 1;
    push_in2 <= 1;
    push_in3 <= 1;
    data_in0 <= 10'b0000000001;
    data_in1 <= 10'b0100000001;
    data_in2 <= 10'b1000000001;
    data_in3 <= 10'b1100000001;
    @(posedge clk);

    pop_in0 <= 1;
    pop_in1 <= 1;
    pop_in2 <= 1;

    repeat(7)begin
    data_in0 <= data_in0 + 1;
    data_in1 <= data_in1 + 1;
    data_in2 <= data_in2 + 1;
    data_in3 <= data_in3 + 1;
    @(posedge clk);
    end
    
    @(posedge clk);

    data_in0 <= 10'b0000000000;
    data_in1 <= 10'b0000000000;
    data_in2 <= 10'b0000000000;
    data_in3 <= 10'b0000000000;
    // @(posedge clk);
    pop_in0 <= 1;
    pop_in1 <= 1;
    pop_in2 <= 1;
    pop_in3 <= 1;
    repeat(2)begin
        @(posedge clk);
    end

    pop_in0 <= 0;
    pop_in1 <= 0;
    pop_in2 <= 0;
    pop_in3 <= 0;

    repeat(10)begin
        @(posedge clk);
    end

    pop_in0 <= 1;
    // pop_in1 <= 1;
    // pop_in2 <= 1;
    pop_in3 <= 1;

    repeat(13)begin
        @(posedge clk);
    end
    pop_in0 <= 1;
    pop_in1 <= 1;
    // pop_in2 <= 1;
    pop_in3 <= 0;

    repeat(13)begin
        @(posedge clk);
    end
    pop_in0 <= 1;
    pop_in1 <= 1;
    pop_in2 <= 1;
    // pop_in3 <= 1;
    repeat(13)begin
        @(posedge clk);
    end
    pop_in0 <= 1;
    pop_in1 <= 1;
    pop_in2 <= 1;
    pop_in3 <= 1;
    

    repeat(10)begin
        @(posedge clk);
    end
    pop_in0 <= 0;
    pop_in1 <= 0;
    pop_in2 <= 0;
    pop_in3 <= 0;

// 6. Envíe 16 palabras, 4 a cada FIFO de entrada, y cada set de 4 palabras por FIFO de entrada
// estén con destino a cada FIFO de salida (las 4x4=16 combinaciones posibles). Deje todos los
// FIFOs vacíos. Verifique que las palabras que salieron son las mismas que entraron y que
// salieron por la salida correcta en la prioridad correcta.
// 7. Lea los contadores de palabras y valide un aumento de 4 palabras por contador.

    // PRIMER VALOR
    data_in0 <= 10'b0000000001;
    data_in1 <= 10'b0000000010;
    data_in2 <= 10'b0000000011;
    data_in3 <= 10'b0000000100;
    
    push_in0 <= 1;
    push_in1 <= 1;
    push_in2 <= 1;
    push_in3 <= 1;

    //         //CERO
    @(posedge clk);

    data_in0 <= 10'b0000000000;
    data_in1 <= 10'b0000000000;
    data_in2 <= 10'b0000000000;
    data_in3 <= 10'b0000000000;

    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);


    // SEGUNDO VALOR
    data_in0 <= 10'b0100000001;
    data_in1 <= 10'b0100000010;
    data_in2 <= 10'b0100000011;
    data_in3 <= 10'b0100000100;

            // CERO
    @(posedge clk);

    data_in0 <= 10'b0000000000;
    data_in1 <= 10'b0000000000;
    data_in2 <= 10'b0000000000;
    data_in3 <= 10'b0000000000;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);


    // TERCER VALOR
    push_in0 <= 1;
    data_in0 <= 10'b1000000001;
    data_in1 <= 10'b1000000010;
    data_in2 <= 10'b1000000011;
    data_in3 <= 10'b1000000100;
    @(posedge clk);
data_in0 <= 10'b0000000000;
    data_in1 <= 10'b0000000000;
    data_in2 <= 10'b0000000000;
    data_in3 <= 10'b0000000000;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);

                // CERO
    @(posedge clk);

    // CUARTO VALOR
    @(posedge clk);
    data_in0 <= 10'b1100000001;
    data_in1 <= 10'b1100000010;
    data_in2 <= 10'b1100000011;
    data_in3 <= 10'b1100000100;
    @(posedge clk);
    data_in0 <= 10'b0000000000;
    data_in1 <= 10'b0000000000;
    data_in2 <= 10'b0000000000;
    data_in3 <= 10'b0000000000;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);


                // CERO
    @(posedge clk);

            //CERO
    @(posedge clk);
    data_in0 <= 10'b0000000000;
    data_in1 <= 10'b0000000000;
    data_in2 <= 10'b0000000000;
    data_in3 <= 10'b0000000000;
    
    repeat(13)begin
        @(posedge clk);
    end
    pop_in0 <= 1;
    // pop_in1 <= 1;
    // pop_in2 <= 1;
    // pop_in3 <= 1;
    repeat(5)begin
        @(posedge clk);
    end
    pop_in0 <= 1;
    pop_in1 <= 1;
    // pop_in2 <= 1;
    // pop_in3 <= 1;
    repeat(5)begin
        @(posedge clk);
    end
    pop_in0 <= 1;
    pop_in1 <= 1;
    pop_in2 <= 1;
    // pop_in3 <= 1;
    repeat(5)begin
        @(posedge clk);
    end
    pop_in0 <= 1;
    pop_in1 <= 1;
    pop_in2 <= 1;
    pop_in3 <= 1;

    repeat(11)begin
        @(posedge clk);
    end

    idx <= 2'b00;
    req <= 1;
    @(posedge clk);
    idx <= 2'b01;
    req <= 1;
    @(posedge clk);
    idx <= 2'b10;
    req <= 1;
    @(posedge clk);
    idx <= 2'b11;
    req <= 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);




    #25 $finish;
end


always @(posedge clk) begin
    if ((data_out0_c == data_out0_e) & (data_out1_c == data_out1_e) & (data_out2_c == data_out2_e) & (data_out3_c == data_out3_e))begin
        Checker_data_out = 1'b1;
    end
    else begin
        Checker_data_out = 1'b0;
    end
end
endmodule
