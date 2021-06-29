all: execute sim gtkwave


execute: BancoPruebas.v
	iverilog -o BancoPruebas.vvp BancoPruebas.v

sim: BancoPruebas.vvp
	vvp BancoPruebas.vvp
	
gtkwave: contador.vcd
	gtkwave contador.vcd