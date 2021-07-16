all: FIFO Contador MUX arbitro completo

FIFO:
	make -f Makefile_FIFO

Contador:
	make -f Makefile_Contador

MUX:
	make -f Makefile_MUX

arbitro:
	make -f Makefile_arbitro

completo:
	make -f Makefile_completo

sintesis:

	yosys Contador.ys
	sed -i 's/Contador/Contador_estruct/' Contador_estruct.v

	yosys arbitro.ys
	sed -i 's/arbitro/arbitro_estruct/' arbitro_estruct.v

	yosys FIFO.ys
	sed -i 's/FIFO/FIFO_estruct/' FIFO_estruct.v
	sed -i 's/true_dpram_sclk/true_dpram_sclk_estruct/' FIFO_estruct.v

	yosys MUX.ys
	sed -i 's/MUX/MUX_estruct/' MUX_estruct.v

	yosys MaquinaEstados.ys
	sed -i 's/MaquinaEstados/MaquinaEstados_estruct/' MaquinaEstados_estruct.v

gtk:
	gtkwave completo.vcd &
