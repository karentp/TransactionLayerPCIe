all: sintesis autoinst execute sim gtkwave

sintesis: FIFO.ys
	yosys FIFO.ys
	sed -i 's/FIFO/FIFO_estruct/' FIFO_estruct.v
	sed -i 's/true_dpram_sclk/true_dpram_sclk_estruct/' FIFO_estruct.v

autoinst:
	emacs --batch  BancoPruebas.v  -f verilog-batch-delete-auto
	emacs --batch  BancoPruebas.v  -f verilog-batch-inject-auto

execute: BancoPruebas.v
	iverilog -o BancoPruebas.vvp BancoPruebas.v

sim: BancoPruebas.vvp
	vvp BancoPruebas.vvp
	
gtkwave: contador.vcd
	gtkwave contador.vcd