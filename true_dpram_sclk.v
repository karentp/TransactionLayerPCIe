// ***** dar reconocimientos luego

module true_dpram_sclk
(
	input [9:0] data_a, 
	// input [7:0] data_b,
	input [2:0] addr_wa,    
    input [2:0] addr_ra,            //Añadido
    // input [5:0] addr_b,
	input we_a, 
	// input we_b, 
    input re_a,                     // Añadido
	input clk,
    input reset,
	output reg [9:0] q_a 
	// output reg [7:0] q_b
);

	// Declare the RAM variable
	reg [9:0] ram[7:0];
	
	// Port A
	always @ (posedge clk)
	begin
    if(reset == 0)begin         // Añadido
        q_a <= 0;
    end
    else begin
		if (we_a) 
		begin
			ram[addr_wa] <= data_a;
			// q_a <= data_a;
		end
		if (re_a)          //Añadido
		begin
			q_a <= ram[addr_ra];
		end
        else begin
            q_a <= 10'b0;
        end
        end
	end
	
	// Port B
	// always @ (posedge clk)
	// begin
	// 	if (we_b)
	// 	begin
	// 		ram[addr_b] <= data_b;
	// 		q_b <= data_b;
	// 	end
	// 	else
	// 	begin
	// 		q_b <= ram[addr_b];
	// 	end
	// end
	
endmodule
