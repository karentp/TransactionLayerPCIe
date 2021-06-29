all: sintesis execute sim gtkwave

sintesis: FIFO.ys
	yosys FIFO.ys
	sed -i 's/FIFO/FIFO_estruct/' FIFO_estruct.v
	sed -i 's/true_dpram_sclk/true_dpram_sclk_estruct/' FIFO_estruct.v


execute: BancoPruebas.v
	iverilog -o BancoPruebas.vvp BancoPruebas.v

sim: BancoPruebas.vvp
	vvp BancoPruebas.vvp
	
gtkwave: contador.vcd
	gtkwave contador.vcd