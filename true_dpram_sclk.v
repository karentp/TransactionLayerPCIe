/////////////////////////////////////////////////////////////////////////
//
//  Verilog True Dual Port RAM with a Single Clock Design Example v1.0 
//  Autor: Intel
//
//  Tomado de:
//  https://www.intel.com/content/www/us/en/programmable/support/support-resources/design-examples/design-software/verilog/ver-true-dual-port-ram-sclk.html
//
////////////////////////////////////////////////////////////////////////

module true_dpram_sclk
(
	input [9:0] data_a, 
	// input [7:0] data_b,
	input [2:0] addr_wa,    
    input [2:0] addr_ra,                //Añadido
    // input [5:0] addr_b,
	input we_a, 
	// input we_b, 
    input re_a,                         // Añadido
	input clk,
    input [3:0] state,
	output reg [9:0] q_a 
	// output reg [7:0] q_b
);

	// Declare the RAM variable
	reg [9:0] ram[7:0];
	
	// Port A
	always @ (posedge clk)begin
	// Estado de RESET = 0001
    if(state == 4'b0001)begin                  // Añadido
        q_a <= 0;
		ram[0] <= 0;
		ram[1] <= 0;
		ram[2] <= 0;
		ram[3] <= 0;
		ram[4] <= 0;
		ram[5] <= 0;
		ram[6] <= 0;
		ram[7] <= 0;
    end
    else begin
		if (we_a) 
		begin
			ram[addr_wa] <= data_a;
			// q_a <= data_a;
		end
		if (re_a)                       //Añadido
		begin
			q_a <= ram[addr_ra];
		end
        else begin
            q_a <= 10'b0;               // Añadido
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