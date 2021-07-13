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
